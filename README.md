Production Manager

The Production Manager App is a graduation project prepared as a final step of Java JEE bootcamp at CodersLab. It is developed in Java and uses Spring and Hibernate frameworks as well as MySQL database. Front-end is created in HTML, CSS and JSP.

The basic version of the App solves a problem of communication between production department and many sales representatives regarding preparing the quotations of customized products.
It targets SME which produce unique items in small quantities – wherever the products needs to be individually quoted each time.

Structure:
- 3 groups of users – production, sales and admin – with differentiated access and views
- products – with many details like dimensions, groups, materials and additional files
- quotations – with information about quantities, delivery dates etc.; email notification when status is changed

Flow:
- sales creates products adding all required information together with files
- sales creates a quotation, adds products to it (with particular qty and delivery info) and send to production dep.
- production quotes items and defines actual delivery dates; sends back to sales
- sales either accepts it or requires corrections
- finally sales accepts the quotation
- approved items are blocked for editing, stored in DB and visible for other sales for reference

Future development:
- timestamp of each change in status of a quotation – it may work as KPI for sales or production
- data validation
- search engine and filters for products
- cloning of products/quotations which are block for editing
- adding module for handling orders 


The project is individually created by me, starting from the very idea of it.
The idea for such application stems from my previous professional experience.
