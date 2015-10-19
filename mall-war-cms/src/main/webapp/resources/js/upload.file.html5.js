var html5_file = {
    fileInput: null,				//html file控件
    upButton: null,					//提交按钮
    url: "",						//ajax地址
    fileFilter: [],					//过滤后的文件数组
    filter: function(files) {		//选择文件组的过滤方法
        return files;
    },
    onSelect: function() {},		//文件选择后
    onDelete: function() {},		//文件删除后
    onProgress: function() {},		//文件上传进度
    onSuccess: function() {},		//文件上传成功时
    onFailure: function() {},		//文件上传失败时,
    onComplete: function() {},		//文件全部上传完毕时
    /****************************************** 开发参数和内置方法分界线 *********************************************/
    //获取选择文件，file控件或拖放
    funGetFiles: function(e) {
        // 获取文件列表对象
        var files = e.target.files || e.dataTransfer.files;
        //继续添加文件
        this.fileFilter = this.fileFilter.concat(this.filter(files));
        this.funDealFiles();
        return this;
    },
    //选中文件的处理与回调
    funDealFiles: function() {
        for (var i = 0, file; file = this.fileFilter[i]; i++) {
            //增加唯一索引值
            file.index = i;
        }
        //执行选择回调
        this.onSelect(this.fileFilter);
        return this;
    },
    //删除对应的文件
    funDeleteFile: function(fileDelete) {
        var arrFile = [];
        for (var i = 0, file; file = this.fileFilter[i]; i++) {
            if (file != fileDelete) {
                arrFile.push(file);
            } else {
                this.onDelete(fileDelete);
            }
        }
        this.fileFilter = arrFile;
        return this;
    },
    //文件上传
    funUploadFile: function() {
        var self = this;
        for (var i = 0, file; file = this.fileFilter[i]; i++) {
            (function(file) {
                var xhr = new XMLHttpRequest();
                if (xhr.upload) {
                    // 上传中
                    xhr.upload.addEventListener("progress", function(e) {
                        self.onProgress(file, e.loaded, e.total);
                    }, false);
                    // 文件上传成功或是失败
                    xhr.onreadystatechange = function(e) {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                self.onSuccess(file, xhr.responseText);
                               // self.funDeleteFile(file);
                                if (!self.fileFilter.length) {
                                    //全部完毕
                                    self.onComplete();
                                }
                            } else {
                                self.onFailure(file, xhr.responseText);
                            }
                        }
                    };
                    // 开始上传
                    var fd = new FormData();
                    fd.append("source", file);
                    xhr.open("POST", self.url, true);
                    xhr.setRequestHeader("file", file.name);
                    xhr.send(fd);
                }
            })(file);
        }
    },
    init: function() {
        var self = this;
        //文件选择控件选择
        if (this.fileInput) {
            this.fileInput.addEventListener("change", function(e) { self.funGetFiles(e); }, false);
        }
        //上传按钮提交
        if (this.upButton) {
            this.upButton.addEventListener("click", function(e) { self.funUploadFile(e); }, false);
        }
    }
};