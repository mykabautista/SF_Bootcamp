trigger HelloWorld on Lead (before update) {
    for(Lead l : Trigger.new){
         l.firstName = 'Hello';
         l.lastName = 'World';   
}
}