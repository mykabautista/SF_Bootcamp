trigger createTask_Opp on Opportunity (after insert) {
    for(Opportunity opp : trigger.new){
        Task newTask 		= new Task();
        newTask.subject 	= 'Apple Watch Promo';
        newTask.Description = 'Send one ASAP!';
        newTask.Priority 	= 'High';
        newTask.WhatId 		= opp.Id;
        insert newTask;
}

}