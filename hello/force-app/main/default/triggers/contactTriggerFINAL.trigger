trigger contactTriggerFINAL on Contact (before insert,before Update,after insert, after update) {

        contactClass.onlyOnePrimaryContact(Trigger.new);
}