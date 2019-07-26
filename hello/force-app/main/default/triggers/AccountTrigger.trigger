trigger AccountTrigger on Account (after insert, after update) 
{
	AccountTriggerHandler.accountContactRelationship(Trigger.new);
}