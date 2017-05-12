/**
 * Common application JS : Common java script functionality 
 * 
 */
var i18nOb = top.frames[0].i18Obj;
var commonapp = {};
var dLanguage = "";
commonapp.ui = {
	/**
	 * Data Table Common Variables
	 */
	DataTableCommon : {
		element : ".common_data_table",
		init : function() {
			dLanguage =  {
				"sProcessing":i18nOb.prop('label.processing'),
			    "sLengthMenu":i18nOb.prop('label.show.menu.entry'),
			    "sZeroRecords":i18nOb.prop('label.no.match.record'),
			    "sInfo": i18nOb.prop('label.showing.entries'),
			    "sInfoEmpty":i18nOb.prop('label.showing.of.entries'),
			    "sInfoFiltered":i18nOb.prop('label.filter.from.tot.entry'),
			    "sInfoPostFix":"",
			    "sSearch":i18nOb.prop('label.search'),
			    "sUrl":"",
			    "oPaginate":{
			        "sFirst":i18nOb.prop('label.first'),
			        "sPrevious":i18nOb.prop('label.previous'),
			        "sNext":i18nOb.prop('label.next'),
			        "sLast":i18nOb.prop('label.sLast')
			     }
			};
		}
	},
	/**
	 * Data Table
	 */
	DataTable : {
		element : "#dTable",
		init : function() {
			$('#dTable').dataTable( {
				"oLanguage":dLanguage,
				"bJQueryUI" : false,
				"sPaginationType" : "full_numbers",
				"aLengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ]
			});
		}
	},
	/**
	 * Net Sale Winning report datatable 
	 */
	NetSaleWinDataTable : { 
		element : "#net_sale_dTable",
		init : function() {
			var columnsLength = $('#net_sale_dTable tr:eq(1) > td').length;
			var aoColumns = [];
			if (columnsLength == 9) {
				aoColumns = null,null, 
						   { "sType": "numeric-comma" },
				           { "sType": "numeric-comma" },
				           { "sType": "numeric-comma" },
				           { "sType": "numeric-comma" },
				           { "sType": "numeric-comma" },
				           { "sType": "numeric-comma" },
				           null;
			} else {
				aoColumns = null, 
						   { "sType": "numeric-comma" },
			               { "sType": "numeric-comma" },
			               { "sType": "numeric-comma" },
			               { "sType": "numeric-comma" },
			               { "sType": "numeric-comma" },
			               { "sType": "numeric-comma" },
			               null;
			}
			$('#net_sale_dTable').dataTable({
				"oLanguage":dLanguage,
				"bJQueryUI" : false,
				"aoColumns": aoColumns,
				"sPaginationType" : "full_numbers",
				"aLengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ]
			});
		}
	},
	/**
	 * Export to Excel
	 */
	ExpExcel : {
		element : "#expExcel",
		init : function() {
			$("#expExcel").on("click", function(e) {
				exportToExcel('dTable');
			});
		}
	},
	/**
	 * Net Sale Winning Report Export to Excel 
	 */
	NetSaleWinExpExcel : {
		element : "#netSaleWinExpExcel",
		init : function() {
			$("#netSaleWinExpExcel").on("click", function(e) {
				exportToExcel('net_sale_dTable');
			});
		}
	},
	/**
	 * Common Utility
	 */
	utility : {
		element : 'body',
		init : function() {
		}
	}

};
commonapp.init = function($) {
	$.each(commonapp.ui, function(n, v) {
		if ($(v.element).length > 0 && typeof v.init === "function") {
			commonapp.ui[n].element = $(v.element);
			v.init();
		}
	});
};
