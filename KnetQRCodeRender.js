function KnetQRCode()
{
	this.Width;
	this.Height;
	this.Render;
	this.Text;
	this.Source;
	this.Option;
	this.Color;
	this.Procedure;
	this.Message;
	this.Row;

	
	this.show = function()
	{
		///UserCodeRegionStart:[show] (do not remove this comment.)
	var _this      = this;
	var KnetQRcode = '' ;	
		
	document.getElementById(this.ContainerName).innerHTML = KnetQRcode;		
	
   	jQuery('#'+this.ContainerName).qrcode({
		render : _this.render,	
		width  : _this.Width,
		height : _this.Height,
		color  : _this.Color,
		text   : _this.Text,
	});	
	
	var objeto = _this.Procedure;
	
	if(_this.Option == 'AutoCommit'){

		console.log(this.Row);

		var canvas = $('#'+this.ContainerName).children()[0];
		var image = canvas.toDataURL("image/jpeg");
			image = image.replace('data:image/png;base64,', '');

			$.ajax({
				type: 'POST',
				url: _this.Procedure,
				data: {KnetQRCode:image,Id:this.Row}			
			});
	}
	
	
	if (_this.Option == 'OnClick'){

	 $(function() {
	 	$('#'+_this.ContainerName).click(function() {
		
		var canvas = $('#'+this.ContainerName).children()[0];
		var image = canvas.toDataURL("image/jpeg");
			image = image.replace('data:image/png;base64,', '');

				$.ajax({
					type: 'POST',
					url: _this.Procedure,
					data: {KnetQRCode:image,Id:this.Row},
					success: function(msg) {
						alert(_this.Message);
					}
				});
			});
		});			 
	}

  
	///UserCodeRegionEnd: (do not remove this comment.)
	}
	///UserCodeRegionStart:[User Functions] (do not remove this comment.)
	
	///UserCodeRegionEnd: (do not remove this comment.):
}