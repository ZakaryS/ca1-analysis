Scenario: Customer approves a quotation.
	Given an installation is recorded in the system
	And a symptom report is generated for that installation
	And a technician has assessed the installation
	And a fault was identified and recorded during the assessment
	And the fault has been found to be valid
	And a quotation for the proposed work has been drafted
	Given the drafted quotation has been sent to the customer
	When the customer approves the quotation
	Then the approval is recorded
	And work can begin.

Scenario: No fault was found during assessment.
	Given a technician has assessed the installation
	When no fault was found during the assessment
	then no fault report is created
	And no quotation is drafted.

Scenario: Fault report is found to be a false positive.
	Given a technician has assessed the installation
	And a fault was identified and recorded during the assessment
	When the fault report was found to not be valid
	Then no quotation is drafted
	And the case is closed.

Scenario: Customer has died since prior communication.
	Given the quotation has been sent to the customer
	When it is discovered that the customer has died
	Then approval cannot be obtained
	And management panics.