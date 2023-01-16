<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Custom Editor</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-time-picker/latest/tui-time-picker.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script src="/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<div id="grid"></div>
<div>
	<button id="uploadBtn">전송</button>
</div>
<script type="text/javascript">
var gridData;
var grid;
$(function(){
	$("#uploadBtn").on("click",function(e){
		alert("전송");
		
	});
});
class CustomTextEditor{
	constructor(props){
		const el = document.createElement('input');
		const {maxLength} = props.columnInfo.editor.options;
		
		el.type = 'text';
		el.maxLength = maxLength;
		el.value = String(props.value);
		
		this.el = el;
	}
	
	getElement(){
		return this.el;
	}
	
	getValue(){
		return this.el.value;
	}
	
	mounted(){
		this.el.select();
	}
}
let header="${_csrf.headerName}";
let token = "${_csrf.token}";
$.ajax({
	url:"/gallery/grid",
	dataType: 'json',
	type:"post",
	beforeSend:function(xhr){
		xhr.setRequestHeader(header,token);
	},
	success:function(result){
		console.log(JSON.stringify(result));
		gridData = JSON.stringify(result);
		
		let data = {"a":"","b":"","c":""};
		
		grid = new tui.Grid({
			el: document.getElementById('grid'),
		    data : result,
			scrollX: false,
		    scrollY: false,
		    columns: [
		      {
		        header: 'Book_Id',
		        name: 'bookId',
		        sortable: true,
		        sortingType: 'desc',
		        editor: 'text',
		        filter: {type: 'text', showApplyBtn: true, showClearBtn: true}
		      },
		      {
		        header: 'Artist',
		        name: 'title',
		        editor: {
		          type: CustomTextEditor,
		          options: {
		            maxLength: 10
		          }
		        },
		        filter: 'select'
		      },
		      {
		          header: 'Price',
		          name: 'price',
		          editor: 'text',
		          filter: 'number'
		      },
		      {
		          header: 'Release',
		          name: 'release',
		          filter:{
		        	  type: 'date',
		        	  options:{
		        		  format: 'yyyy.MM.dd'
		        	  }
		        	  
		          }
		      },
		      {
		        header: 'Type',
		        name: 'typecode',
		        filter: 'select',
		        formatter: 'listItemText',
		        editor: {
		          type: 'select',
		          options: {
		            listItems: [
		              { text: 'Deluxe', value: '1' },
		              { text: 'EP', value: '2' },
		              { text: 'Single', value: '3' }
		            ]
		          }
		        }
		      },
		      {
		        header: 'Genre',
		        name: 'genrecode',
		        filter: {
		            type: 'text',
		            operator: 'OR'
		          },
		        formatter: 'listItemText',
		        editor: {
		          type: 'checkbox',
		          options: {
		            listItems: [
		              { text: 'Pop', value: '1' },
		              { text: 'Rock', value: '2' },
		              { text: 'R&B', value: '3' },
		              { text: 'Electronic', value: '4' },
		              { text: 'etc.', value: '5' }
		            ]
		          }
		        }
		      },
		      {
		    	 header: 'DownloadCount',
		    	 name: 'downloadcount',
		    	 editor: 'text',
		    	 filter: 'number'
		      },
		      {
		        header: 'Grade',
		        name: 'grade',
		        filter: 'select',
		        copyOptions: {
		          useListItemText: true
		        },
		        formatter: 'listItemText',
		        editor: {
		          type: 'radio',
		          options: {
		            listItems: [
		              { text: '★☆☆', value: '1' },
		              { text: '★★☆', value: '2' },
		              { text: '★★★', value: '3' }
		            ]
		          }
		        }
		      }
		    ],
		    pageOptions: {
		    	useClient: true,
		    	perPage: 7
		    },
		    contextMenu: ({ rowKey, columnName }) => (
		            [
		              [
		                {
		                  name: 'export',
		                  label: 'Export',
		                  subMenu: [
		                    {
		                      name: 'default',
		                      label: 'Default',
		                      subMenu: [
		                        {
		                          name: 'csvExport',
		                          label: 'CSV export',
		                          action: () => {
		                            grid.export('csv');
		                          }
		                        },
		                        {
		                          name: 'excelExport',
		                          label: 'Excel export',
		                          action: () => {
		                            grid.export('xlsx');
		                          }
		                        },
		                      ]
		                    },
		                    {
		                      name: 'includeHeader',
		                      label: 'includeHeader: false',
		                      subMenu: [
		                        {
		                          name: 'csvExport',
		                          label: 'CSV export',
		                          action: () => {
		                            grid.export('csv', { includeHeader: false });
		                          }
		                        },
		                        {
		                          name: 'excelExport',
		                          label: 'Excel export',
		                          action: () => {
		                            grid.export('xlsx', { includeHeader: false });
		                          }
		                        },
		                      ]
		                    },
		                    {
		                      name: 'colunmNames',
		                      label: `['name', 'artist']`,
		                      subMenu: [
		                        {
		                          name: 'csvExport',
		                          label: 'CSV export',
		                          action: () => {
		                            grid.export('csv', { columnNames: ['name', 'artist'] });
		                          }
		                        },
		                        {
		                          name: 'excelExport',
		                          label: 'Excel export',
		                          action: () => {
		                            grid.export('xlsx', { columnNames: ['name', 'artist'] });
		                          }
		                        },
		                      ]
		                    },
		                    {
		                      name: 'onlySelected',
		                      label: 'onlySelected: true',
		                      subMenu: [
		                        {
		                          name: 'csvExport',
		                          label: 'CSV export',
		                          action: () => {
		                            grid.export('csv', { onlySelected: true });
		                          }
		                        },
		                        {
		                          name: 'excelExport',
		                          label: 'Excel export',
		                          action: () => {
		                            grid.export('xlsx', { onlySelected: true });
		                          }
		                        },
		                      ]
		                    },
		                  ],
		                }
		              ],
		            ]
		          ),
		  });
		  grid.on('beforeChange', ev => {
		    console.log('before change:', ev);
		  });
		  grid.on('afterChange', ev => {
		    console.log('after change:', ev);
		     console.log(ev.changes[0].value);
		  })
		  grid.resetData(gridData);
	
	}
});



</script>

</body>
</html>