(/*{
	getLabel : function(component, event, helper) {
		var myLabel = component.find("button1").get("v.label");
        component.set("v.buttonLabel",myLabel);
	}*/
 {
    helloButton : function(component, event, helper){
    	var myHello = component.find("Name1").get("v.value");
        if(myHello.length > 3){
            component.set("v.truthy",false);
            alert("Hello " + myHello + " ❤");
        }
        else{
            component.set("v.truthy",true);
            
        }
    },
     showBlock : function(component, event, helper){
         component.set('v.visible',!component.get('v.visible'));
         component.set('v.notVisible',!component.get('v.notVisible'));
         
    },
     searchButton : function(component, event, helper){
         helper.searchAccountHelper(component, event, helper);
    }
})