({  /* This methid populates the event parameter by getting otherChildInput attribute,
    then fires the app event*/
	sendToListeners : function(component, event, helper) {
        //Get Input Value
        var otherChildInputVar = component.get("v.otherChildInput");
        //Get the registered Event Note that on App event "$A.get" should be used and 
        //the event name is the name of the APP COMPONENT ITSELF
        var appEvent =  $A.get("e.c:sampleApplicationEvent");
        //Populate Event Parameters
        appEvent.setParams({"appEventMessage" : otherChildInputVar});
        //Fire event
        appEvent.fire();
    }
})