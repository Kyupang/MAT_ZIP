<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>맛집 등록</title>
 	<style>
 	/* 드래그엔 드랍 스타일 */
 	.upload-box {
	  width: 100%;
	  box-sizing: border-box;
	  margin-right: 30px;
	  margin-bottom: 30px;
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	}
	.upload-box .drag-file {
	  position: relative;
	  width: 100%;
	  height: 700px;
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	  border: 3px dashed #dbdbdb;
	}
	.upload-box .drag-file.highlight {
	  border: 3px dashed red;
	}
	.upload-box .drag-file .image {
	  width: 40px;
	}
	.upload-box .drag-file .message {
	  margin-bottom: 0;
	}
	.upload-box .drag-file .preview {
	  display: none;
	  position: absolute;
	  left: 0;
	  height: 0;
	  width: 100%;
	  height: 100%;
	}
 	
 	/* 이미지 파일 선택 스타일 */
    .file-label {
	  margin-top: 30px;
	  background-color: #5b975b;
	  color: #fff;
	  text-align: center;
	  padding: 10px 0;
	  width: 65%;
	  border-radius: 6px;
	  cursor: pointer;
	  
	}
	.file {
	  display: none;
	}
    	
      /* 모달 대화 상자 스타일 */
      .modal {
        display: none;
        position: center;
        z-index: 1;
        left: 0;
        top: 0;
        width: 70%;
        height: 70%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
      }

      /* 모달 내부 스타일 */
      .modal-content {
        background-color: #fefefe;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
      }
    </style>
  </head>
  

  <body>
    <button onclick="openModal()">맛집 등록</button>
	<hr>
	
    <div id="myModal" class="modal">
      <div class="modal-content">
        <!-- 새로운 UI 내용을 여기에 추가 -->
        <h2>영수증 이미지나 결제내역을 주소가 잘 보이게 찍어 업로드</h2>
        
        <div id="root">
		  <div class="contents">
    		<div class="upload-box">
      			<div id="drop-file" class="drag-file">
        			<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
        			<p class="message">Drag files to upload</p>
        			<img src="" alt="미리보기 이미지" class="preview" id="preview-image">
      			</div>
      			<label class="file-label" for="chooseFile">Choose File</label>
      			<input class="file" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
    			<button id="upload-button">업로드</button>
    		</div>
  		 </div>
		</div>

        <button onclick="closeModal()">닫기</button>
      </div>
    </div>
	<hr>
	맛집 지도가 표시될 위치입니다. 


    <script>
	  
		
	
      // 모달 대화 상자 열기
      function openModal() {
        document.getElementById("myModal").style.display = "block";
      }

      // 모달 대화 상자 닫기
      function closeModal() {
        document.getElementById("myModal").style.display = "none";
      }
      
      function DropFile(dropAreaId, fileListId) {
    	  let dropArea = document.getElementById(dropAreaId);
    	  let fileList = document.getElementById(fileListId);
		  
    	      	  
    	  function preventDefaults(e) {
    	    e.preventDefault();
    	    e.stopPropagation();
    	  }

    	  function highlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.add("highlight");
    	  }

    	  function unhighlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.remove("highlight");
    	  }

    	  function handleDrop(e) {
    	    unhighlight(e);
    	    let dt = e.dataTransfer;
    	    let files = dt.files;

    	    handleFiles(files);

    	    const fileList = document.getElementById(fileListId);
    	    if (fileList) {
    	      fileList.scrollTo({ top: fileList.scrollHeight });
    	    }
    	  }

    	  function handleFiles(files) {
    	    files = [...files];
    	    // files.forEach(uploadFile);
    	    files.forEach(previewFile);
    	  }
    	  
    	  	

    	  function previewFile(file) {
    	    console.log(file);
    	    renderFile(file);
    	  }

    	  function renderFile(file) {
    	    let reader = new FileReader();
    	    reader.readAsDataURL(file);
    	    reader.onloadend = function () {
    	      let img = dropArea.getElementsByClassName("preview")[0];
    	      img.src = reader.result;
    	      img.style.display = "block";
    	    };
    	  }

    	  dropArea.addEventListener("dragenter", highlight, false);
    	  dropArea.addEventListener("dragover", highlight, false);
    	  dropArea.addEventListener("dragleave", unhighlight, false);
    	  dropArea.addEventListener("drop", handleDrop, false);

    	  return {
    	    handleFiles
    	  };
    	}

    	const dropFile = new DropFile("drop-file", "files");
      
    </script>
  </body>
</html>
