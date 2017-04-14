<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

Ext.onReady(function(){
    Ext.create('Ext.panel.Panel',{
        renderTo : Ext.getBody(),
        width : 300,
        height : 300,
        title : '콤보박스예제코드',
        items : [{
            //콤보박스 컴포넌트 선언
            xtype : 'combo',
            //최초에는 빈값이 출력되므로 설정
            emptyText : '선택',
            //화면에 보여주는 store data속성의 key값
            displayField: 'option_text',
            //실제 선택되었을때의 store data속성의 key값
            valueField: 'option_value',
            //default true값이여서 화면에 보여지는 displayField값 수정이 됩니다.
            //false로 지정해줘야 제대로된 콤보박스기능이 동작됩니다.
            editable : false,
            //데이터 스토어 사용
            store : Ext.create("Ext.data.Store",{
                        //data 속성의 json object에 정의된 key 값들과 매칭시켜줍니다.
                        fields : ['option_text','option_value'],
                        proxy : {
                            //ajax 비동기 방식을 이용
                            type : 'ajax',
                            api : {
                                //read 속성을 response 데이터를 받을경우 사용합니다.
                                //db의 select 쿼리의결과를 받을 경우
                                read : '/response.jsp'
                            },
                            //api->read 속성의 url값으로 부터 응답받은 object값을 받기 위한 속성
                            reader : {
                                type : 'json',
                                successProperty : "success",
                                rootProperty : 'items'
                            }
                        }
                    })
        }]
    })
})

JSONArray jsonArray = new JSONArray();
JSONObject jsonObject = new JSONObject();
JSONObject jsonObjectSub = null;
 
jsonObjectSub = new JSONObject();
jsonObjectSub.put("option_text", "보여주는값1");
jsonObjectSub.put("option_value", "선택값1");
jsonArray.add(jsonObjectSub);
 
jsonObjectSub = new JSONObject();
jsonObjectSub.put("option_text", "보여주는값2");
jsonObjectSub.put("option_value", "선택값2");
jsonArray.add(jsonObjectSub);
 
jsonObjectSub = new JSONObject();
jsonObjectSub.put("option_text", "보여주는값3");
jsonObjectSub.put("option_value", "선택값3");
jsonArray.add(jsonObjectSub);
 
// successProperty 속성의 key값과 맞춰주며 true/false로 정해줍니다.
jsonObject.put("success", true);
// 최상단의 key값은 rootProperty 속성의 key로 정의해준값과 맞춰줍니다.
jsonObject.put("items", jsonArray);
response.setContentType("text/plain; charset=UTF-8");
PrintWriter pw = response.getWriter();
pw.print(jsonObject);
pw.flush();
pw.close();





</script>


</html>