public class InvoiceController {
    public String selectedProjectId { get; set; }
    public Decimal invoiceAmount { get; set; } // Amount for the invoice
    public Boolean isInvoiceGenerated { get; set; }
    public List<SelectOption> projects { get; private set; }

    public InvoiceController() {
        isInvoiceGenerated = false;
        projects = new List<SelectOption>();
        loadProjects();
        invoiceAmount = 0; // Initialize amount (you can change this as needed)
    }

    private void loadProjects() {
        // Example: Loading project options (customize this query according to your project object)
        List<Project__c> projectList = [SELECT Id, Name FROM Project__c LIMIT 100];
        for (Project__c project : projectList) {
            projects.add(new SelectOption(project.Id, project.Name));
        }
    }

    public void generateInvoice() {
        if (String.isNotBlank(selectedProjectId) && invoiceAmount > 0) {
            // Logic to generate invoice (create an Invoice__c record)
            Invoice__c newInvoice = new Invoice__c();
            newInvoice.Project__c = selectedProjectId;
            newInvoice.Amount__c = invoiceAmount; // Set the amount

            // Insert the invoice record
            insert newInvoice;

            isInvoiceGenerated = true; // Set flag to true on successful creation
        } else {
            isInvoiceGenerated = false; // Set flag to false if no project selected or amount is invalid
        }
    }
}
