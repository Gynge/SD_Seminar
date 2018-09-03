pageextension 123456701 "CSD ResourceListExt" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {

            }

            field("CSD Maximum Participants";"CSD Maximum Participants")
            {

            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowType := (GetFilter(Type)='');
        ShowMaxField := (GetFilter(Type) = Format(Type::Machine));

    end;
    var
        ShowMaxField : Boolean;
        ShowType : Boolean;
}