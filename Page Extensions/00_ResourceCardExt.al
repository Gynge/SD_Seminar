pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
//Documentation line
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {

            }
            field("CSD Quantity Per Day";"CSD Quantity Per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                visible = ShowMaxField;
                field("CSD Maximum Participants";"CSD Maximum Participants")
                {
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (Type = Type::Machine);
        Currpage.update(false);

    end;
    var
    
        [InDataSet]
        ShowMaxField: boolean;

    

}