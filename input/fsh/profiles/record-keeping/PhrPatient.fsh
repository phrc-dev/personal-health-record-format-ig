// JP Core JP_HumanName: family and given names are stored in this order, separated by one half-width space.
Invariant: phr-humanname-text
Description: "name.text must be the family name and the given name separated by one half-width space."
Severity: #error
Expression: "text.exists() implies text.matches('^[^ 　]+ [^ 　]+$')"

Profile: PhrPatient
Parent: Patient
Description: "Standard PHR profile of the Patient resource."
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-wg].valueCode = #pe

* id 1..1 MS
* name 1..1 MS
* name obeys phr-humanname-text
* name.text 1..1 MS
* active 1..1 MS
* active = true
* identifier 1..* MS
* identifier.system = "http://phr.or.jp/fhir/IdSystem/patient-id"
* identifier.value 1..1 MS
* gender 1..1 MS
