$(document).ready(function(){

	Dropzone.autoDiscover = false;
	// grap our upload form by its id
	$("#new_upload").dropzone({
		// restrict image size to a maximum 1MB
		maxFilesize: 1,
		// changed the passed param to one accepted by
		// our rails app
		//paramName: "upload[images_attributes][][image]",
		paramName: "upload[images_attributes]",
		uploadMultiple: true,
		addRemoveLinks:true,
		parallelUploads: 10,
		//paramName: "image[image]",
		autoProcessQueue: false,



		  init: function() {
	 	
		  	var submitButton = document.querySelector("#new_upload")
		  	 myDropzone = this; // closure
			
		    submitButton.addEventListener("click", function(e) {
		           myDropzone.processQueue(); 
		    });


		  }
  });	




});













