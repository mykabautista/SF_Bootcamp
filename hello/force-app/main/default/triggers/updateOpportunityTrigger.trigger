trigger updateOpportunityTrigger on Opportunity (before update) {
     
        updateOpportunity.stageNameVerification(Trigger.new,Trigger.oldMap);

                              
}