<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="modal-batch-upload-images" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>图片上传</h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <div style="height: 25px;">
              <button class="tiny radius right">选取照片
                <input id="fileImage" type="file" size="30" name="fileselect[]" accept="image/jpeg" class="file-picker" multiple/>
              </button>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <ul id="preview">
            </ul>
          </div>
          <div class="col-xs-12" id="uploadInf">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="small radius hide expand" type="button" id="upload-img">上传</button>
      </div>
    </div>
  </div>
</div>