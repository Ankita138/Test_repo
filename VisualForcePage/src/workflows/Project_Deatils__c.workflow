<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Project_Created</fullName>
        <description>New Project Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>ankita.kumari@eternussolutions.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Project_new_created</template>
    </alerts>
    <alerts>
        <fullName>X5_Day_for_Project_To_end</fullName>
        <description>5 Day for Project To end</description>
        <protected>false</protected>
        <recipients>
            <recipient>ankita.kumari@eternussolutions.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/End_Date</template>
    </alerts>
    <alerts>
        <fullName>X5_Day_for_Project_To_end1</fullName>
        <description>5 Day for Project To end1</description>
        <protected>false</protected>
        <recipients>
            <recipient>ankita.kumari@eternussolutions.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/End_Date</template>
    </alerts>
    <alerts>
        <fullName>X5_Day_for_Project_To_end2</fullName>
        <description>5 Day for Project To end2</description>
        <protected>false</protected>
        <recipients>
            <recipient>ankita.kumari@eternussolutions.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/End_Date</template>
    </alerts>
    <fieldUpdates>
        <fullName>Status_Change</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Status Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Edist</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Status Edist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Project</fullName>
        <actions>
            <name>New_Project_Created</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_Project_Assignment</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>X5_Day_for_Project_To_end2</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project_Deatils__c.End_Date__c</offsetFromField>
            <timeLength>-5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Status Change</fullName>
        <actions>
            <name>Status_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project_Deatils__c.End_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>New_Project_Assignment</fullName>
        <assignedTo>Manager</assignedTo>
        <assignedToType>role</assignedToType>
        <description>New Project has been Created</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project_Deatils__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>New Project Assignment</subject>
    </tasks>
</Workflow>
