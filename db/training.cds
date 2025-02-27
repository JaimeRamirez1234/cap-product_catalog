namespace com.training;


entity Course {
    key ID      : UUID;
        Student : Association to many StudentCourse
                      on Student.Course = $self;
};

entity Student {
    key ID     : UUID;
        Course : Association to many StudentCourse
                     on Course.Student = $self;

};

entity StudentCourse {
    key ID      : UUID;
        Student : Association to Student;
        Course  : Association to Course;
};


// type EmailsAddresses_01 : array of {
//     kind  : String;
//     email : String;
// };

// type EmailsAddresses_02 {
//     kind  : String;
//     email : String;
// }

// type Emails {
//     email_01  :      EmailsAddresses_01;
//     email_02  : many EmailsAddresses_02;
//     email_03  : many {
//         kind  :      String;
//         email :      String;
//     }
// }

// type Gender             : String enum {
//     male;
//     female;
// };

// entity Order {
//     clientGender : Gender;
//     status       : Integer enum {
//         submitted = 1;
//         fulfiller = 2;
//         shipped   = 3;
//         cancel    = -1;
//     };
//     Priority     : String @assert.range enum {
//         high;
//         medium;
//         low;
//     }
// }

// entity Car {
//     key ID                 : UUID;
//         name               : String;
//         virtual discount_1 : Decimal;
//         virtual discount_2 : Decimal;
// }

// entity ParamProducts (pName : String) as select from Products{
//     Name,
//     Price,
//     Quantity
// }

// entity ProjParamProducts (pName : String) as projection on Products
//                         where Name = :pName;

// entity Customer {

//     key ID   : Integer;
//         name : String;

// };