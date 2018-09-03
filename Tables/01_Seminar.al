table 123456701 "CSD Seminar"
{
    Caption ='Seminar';
    LookupPageId = "CSD Seminar List";
    DrillDownPageId = "CSD Seminar List";
        
    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20;"Name";Text[50])
        {
            Caption = 'Name';
            trigger OnValidate()
            begin
                IF "Search Name" = UPPERCASE(xRec.Name) then
                    "Search Name" := UPPERCASE(Name);
            end;
        }
        field(30;"Seminar Duration";decimal)
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
            trigger OnValidate()
            begin
                IF GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup,"Gen. Prod. Posting Group") then
                  VALIDATE("Vat. Prod. Posting Group",GenProdPostingGroup."Def. VAT Prod. Posting Group");
            end;
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
        key(Key1;"Search Name")
        {
        }
    }
    
    var
        SeminarSetup : Record "CSD Seminar Setup";
        //CommentLine : Record "CSD Seminar Comment Line";
        Seminar : Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No."='' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Modified Date" := Today;
    end;

    trigger OnDelete();
    begin
        //CommentLine.Reset;
        //CommentLine.SetRange("Table Name",CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        // CommentLine.DeleteAll;
    end;

    trigger OnRename();
    begin
        "Last Modified Date" := Today;
    end;
    procedure AssistEdit():Boolean;
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            IF NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",xRec."No. Series","No. Series") THEN begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                Exit(true);
            END;
        end;
    end;

}