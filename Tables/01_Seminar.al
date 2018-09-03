table 123456701 "CSD Seminar"
{
    Caption ='Seminar';
        
    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
        }
        field(20;"Name";Text[50])
        {
            Caption = 'Name';
        }
        field(30;"Duration";decimal)
        {
            Caption ='Duration';
            DecimalPlaces = 0:1;
        }
       field(40;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(50;"Maximum Participants";Integer)
        {
            Caption ='Maximum Participants';
        }
        field(60;"Search Name";Code[50])
        {
            Caption = 'Search Name';
        }
        field(70;"Blocked";boolean)
        {
            Caption = 'Blocked';
        }
        field(80;"Last Modified Date";Date)
        {
            Caption = 'Last Modified Date';
            Editable = false;
        }
        field(90;"Comment";Boolean)
        {
            Caption ='Comment';
            FieldClass = FlowField;
            //CalcFormula=exits("Seminar comment Line" where("Table Name" = const("Seminar"), "No."=Field("No.")));
            Editable = false;
        }
        field(100;"Price";Decimal)
        {
            Caption = 'Price';
            AutoFormatType = 1;
        }
        field(110;"Gen. Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(120;"Vat. Prod. Posting Group";Code[10])
        {
            Caption = 'Vat. Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130;"No. Series";Code[10])
        {
            Caption = 'No. Serires';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
        key(Search;"Search Name")
        {
            Clustered = false;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}