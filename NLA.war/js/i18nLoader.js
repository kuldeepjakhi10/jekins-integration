loadFile();
var i18Obj;

function loadFile() {
	if(typeof fileName != 'undefined'){
		$.i18n.properties( {
			name : fileName,
			path : projectName+'/bundle/',
			mode : 'both',
			language: lang,
			callback : function() {
				i18Obj = $.i18n;
		}
		});
	}
}
