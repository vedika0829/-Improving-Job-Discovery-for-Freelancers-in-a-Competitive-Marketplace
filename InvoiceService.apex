public class InvoiceService {
    public static void generateInvoice(Project__c project) {
        if (project.Status__c == 'Completed') {
            // Create a new invoice
            Invoice__c invoice = new Invoice__c();
            invoice.Project__c = project.Id;
            invoice.Amount__c = ProjectUtility.calculateTotalAmount(project, false); // Calculate using actual task costs
            
            // Debug logs
            System.debug('Creating invoice for Project: ' + project.Id + ', Amount: ' + invoice.Amount__c);
            
            // Insert the invoice
            try {
                insert invoice;
                System.debug('Invoice created successfully: ' + invoice.Id);
            } catch (Exception e) {
                System.debug('Error creating invoice: ' + e.getMessage());
            }
        } else {
            System.debug('Project status is not completed. Current status: ' + project.Status__c);
        }
    }
}
