page 123456702 "CSD Seminar List"
{
    Caption = 'Seminar List';
    PageType = List;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardpageID = 123456701;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    caption = 'No.';
                }
                field(Name;Name)
                {
                    Caption = 'Name';
                }
                field("Seminar Duration";"Seminar Duration")
                {
                    Caption = 'Duration';
                }
                field(Price;Price)
                {
                    caption = 'Price';
                }
                field("Minimum Participants";"Minimum Participants")
                {
                    caption = 'Minimum Participants';
                }
                field("Maximum Participants";"Maximum Participants")
                {
                    caption = 'Maximum Participants';
                }
            }
        }
        area(factboxes)
        {
            systempart("Links";Links)
            {

            }
            systempart("Notes";Notes)
            {

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Seminar)
            {
                action(Comments)
                {
                    //RunObject=page "Seminar Comment Sheet";
                    //RunPageLink = "Table Name"=const(Seminar),"No."=field("No.");
                    Image = Comment;
                }

            }
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}