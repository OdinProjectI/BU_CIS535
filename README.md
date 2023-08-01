# BU_CIS535
CIS535 Case Study Project


# **Project Overview**
The case study project aims to revolutionize Bob's small business by leveraging cutting-edge technology and modern software development practices. The primary objective is to computerize Bob's business's essential elements, such as billing customers, viewing the material used for a specific project, and managing supplier payments, to enhance efficiency, accuracy, and overall business performance.  

As a successful handyman business owner, Bob has manually managed various aspects, relying on traditional methods like pen and paper. However, as the business grows, these manual processes can become time-consuming, prone to errors, and challenging to maintain. To overcome these challenges and take Bob's business to the next level, I build a software package that integrates seamlessly with his existing workflow, using the following technology stacks: 
* T-SQL: T-SQL, a powerful database language, to design a well-structured 

and secure database that stores essential business data.  

* AWS RDS: AWS RDS will provide the scalability, reliability, and cloud-based storage required to handle the increasing volume of data as the business expands.  

* Google-Colab: A cloud-based interactive environment for data science to streamline data processing, generate insightful reports, and perform analytics, giving Bob the advantage of data-driven decision-making, enabling him to identify trends, manage finances effectively, and optimize operations.  

The overall goal of this case study project is to increase efficiency and reduce manual workload, improve accuracy in billing and supplier management, and enhance financial visibility. Also, the cloud technologies (AWS & Google-Colab) will optimize his day-to-day operations and position Bob's handyperson business as a competitive force in the market.  
 
# **How to use the Software Package** 
    1. Connecting to the Colab Notebook
        1. Register your IP Address  
            1.1. Email your IP address to your assigned administrator as described in the contract agreement.  
        2. Accessing Google-Colab  
            2.1. Go to the following URL https://colab.research.google.com/github/OdinProjectI/BU_CIS535/blob/main/CIS535_CaseStudyProject_Week9_Sofware_Package.ipynb 
            2.2. Click on the "Sign In" button in the top right corner. You will be prompted to sign in with your Google account.  
            2.3. Enter your Gmail credentials to sign in. 
            2.4. After signing in, Google Colab will request your permission to access your Google Drive, which is necessary as Google Colab allows you to save and load notebooks directly from your Google Drive. Click on "Allow" to grant access.   
            2.5. Once you've signed in and been granted access, you will be redirected to the Google Colab dashboard. You can access the collaborative Jupyter Notebook environment and interact with the MSSQL database from there.  
    2. Documentation  
        2.1. Tables  
            2.1.1. Materials: The purpose of the material table is to store essential information about various materials used in a project.  
            2.1.2. SupplierPayment: The purpose of the SupplierPayment table is to record and track payments made to suppliers for the materials or services they provide, manage financial transactions, ensure timely payment, and maintain a clear payment history with suppliers.  
            2.1.3. SupplierInvoice: The purpose of the SupplierInvoice table is to store and manage invoices received from suppliers for materials or services provided and helps track payment obligations, ensure accurate billing, and maintain a record of supplier transactions.  
            2.1.4. SupplierBilling: The purpose of the SupplierBilling table is to store and manage billing information related to the materials or services provided by the suppliers, keep track of billing details and amounts owed to the suppliers, and facilitate accurate payment processing.  
            2.1.5. CustomerPayment: The purpose of the CustomerPayment table is to record and manage payments received from customers for products or services provided and keep track of customer transactions, ensure timely payments, and maintain a clear payment history with customers.   
            2.1.6. CustomerInvoice: The purpose of the CustomerInvoice table is to record and manage payments received from customers for products or services provided, and helps to track customer transactions, ensure timely payments, and maintain a clear payment history with customers.  
            2.1.7. CustomerBilling: The purpose of the CustomerBilling table is to store billing information for products or services provided to customers and generate invoices, track payments, and manage customer billing records efficiently.  
            2.1.8. Repair: The purpose of the Repair table is to record repair requests for various items and helps track repair history, prioritize tasks, and efficiently manage maintenance activities.  
            2.1.9. Bid: The purpose of the Bid Table is to store bids submitted by various entities for a specific project and facilitates bid comparison, decision-making, and contract, streamlining the procurement process.  
            2.1.10. Customers: The purpose of the Customer table is to store essential information about individual customers or clients and help maintain customer details, cush as names, contact information, and transaction history, enabling efficient customer management and personalized services.  
            2.1.11. NOTE: Follow the ERD diagram for clarification  
        2.2. T-SQL Custom Function  
            2.2.1. GetMaterials: T-SQL Function to list the names of the customers who provided bids last month. Also, this function simplifies the bid search query. 
            2.1.2. SearchCustomersOutstandingBalance: T-SQL function to list all the customers with an outstanding balance greater than $500 or any given balance amount.  
            2.1.3. GenerateCustomerInvoice: Bill remainder function that searches DB for current due dates based on a given month and year 
        2.3. T-SQL View Table 
            2.3.1. SupplierBillings: T-SQL view table to list all outstanding balances over a  thousand dollars. 
        2.4. Report Generations  
            2.4.1. Query to list the names of the customers who provided bids last month. 
            2.4.2. Query to list all the customers with an outstanding balance (amount due to Bob) greater than five hundred dollars.  
            2.4.3. Query to list all the suppliers where Bob has an outstanding balance of over a thousand dollars. 
            2.4.4. Query to list all the material that was used for bids where the estimated hours for the bid were greater than forty hours. 
            2.4.5. Query to list all the materials that Bob purchased from a specific supplier.  
        2.5. Data Visualizations  
            2.5.1. Visualize the monthly number of transactions.  
            2.5.2. Visualize the billing history for a given season. 
