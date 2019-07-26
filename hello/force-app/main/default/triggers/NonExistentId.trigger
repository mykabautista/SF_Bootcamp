trigger NonExistentId on Case (before insert) {
    for (Case myCase: Trigger.new){
    CaseComment cc = new CaseComment();
    cc.CommentBody = 'Case received by Agent';
    cc.ParentId    = myCase.Id;
    insert cc;
    }
}