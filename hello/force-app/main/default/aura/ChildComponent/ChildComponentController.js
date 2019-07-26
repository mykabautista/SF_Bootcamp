({  /*This method gets the child input then pass it to the event parameter
      then fires the event */
    sendToParent : function(component, event, helper) {
        //Get Input Value
        var childInputVar = component.get("v.childInput");
        //Get the registered Event
        var compEvent = component.getEvent("childEvent");
        //Populate Event Parameters
        compEvent.setParams({"eventMessage" : childInputVar});
        //Fire event
        compEvent.fire();
    },
    /* This method will be executed whenever 
     this component detect that an event it is handling is fired */
    passAppEventmessagetoChild : function(component, event, helper) {
        //Get event value
        var eMsg =  event.getParam("appEventMessage");
        //Put event message to msgFromChild attribute
        component.set("v.msgFromOtherChild", eMsg );
    },
    changeChild : function(component, event, helper) {
        var childInputVar2 = component.get("v.childInput");
        component.set("v.childOutput",childInputVar2);
    }
})