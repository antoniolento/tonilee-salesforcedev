trigger ClosedOpportunityTrigger on Opportunity (after insert, after update){

	List<Task> taskToInsert = new List<Task>();

	for(Opportunity opp: Trigger.New){

		if(opp.StageName == 'Closed Won'){

			taskToInsert.add(new Task(Subject = 'Follow Up Test Task', 
										WhatId = opp.Id));

		}

	}

	if(taskToInsert.size() > 0){

		insert taskToInsert;

	}

}