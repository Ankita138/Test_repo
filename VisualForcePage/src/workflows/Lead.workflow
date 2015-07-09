<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Follow_up_expiry_date</fullName>
        <description>Follow up expiry date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Follow_up_expired</template>
    </alerts>
    <fieldUpdates>
        <fullName>DNC</fullName>
        <field>Stage__c</field>
        <literalValue>DNC</literalValue>
        <name>DNC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Landline</fullName>
        <field>Stage__c</field>
        <literalValue>LAND LINE</literalValue>
        <name>Landline</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mobile</fullName>
        <field>Stage__c</field>
        <literalValue>MOBILE</literalValue>
        <name>Mobile</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_Number</fullName>
        <field>Stage__c</field>
        <literalValue>NO NUMBER</literalValue>
        <name>No Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_Number1</fullName>
        <field>Stage__c</field>
        <literalValue>NO NUMBER</literalValue>
        <name>No Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Dnc</fullName>
        <field>RecordTypeId</field>
        <lookupValue>DNC</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Dnc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Landline</fullName>
        <field>RecordTypeId</field>
        <lookupValue>LANDLINE</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Landline</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Mobile</fullName>
        <field>RecordTypeId</field>
        <lookupValue>MOBILE</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Mobile</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_No_Number</fullName>
        <field>RecordTypeId</field>
        <lookupValue>NO_NUMBER</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update No Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>DNC</fullName>
        <actions>
            <name>DNC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Dnc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Follow up date</fullName>
        <active>false</active>
        <formula>Follow_up__c  &lt;   TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Follow_up_expiry_date</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Lead.Follow_up__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Landline</fullName>
        <actions>
            <name>Landline</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Landline</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(
    NOT( ISBLANK( Phone)), AND( DoNotCall == FALSE, ISBLANK(  MobilePhone )),FALSE
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mobile</fullName>
        <actions>
            <name>Mobile</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Mobile</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF((NOT(ISBLANK( MobilePhone ))), AND( DoNotCall ==FALSE, ISBLANK(Phone)) ,FALSE )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>No Number</fullName>
        <actions>
            <name>No_Number1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_No_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( DoNotCall == FALSE, ISBLANK( Phone ) ,ISBLANK( MobilePhone ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
