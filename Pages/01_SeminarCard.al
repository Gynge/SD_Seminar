page 123456701 "CSD Seminar Card"
{
    PageType = Card;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar Card';

    layout
    {
        area(content)
        {
            group("General")
            {
                field("No.";"No.")
                {
                    Caption = 'No.';
                }
                field(Name;Name)
                {
                    Caption = 'Name';
                }
                field("Search Name";"Search Name")
                {
                    Caption = 'Search Name';
                }
                field("Seminar Duration";"Seminar Duration")
                {
                    Caption = 'Duration';
                }
                field("Minimum Participants";"Minimum Participants")
                {
                    caption = 'Minimum Participants';
                }
                field("Maximum Participants";"Maximum Participants")
                {
                    Caption = 'Maximum Participants';
                }
                field(Blocked;Blocked)
                {
                    Caption = 'Blocked';
                }
                field("Last Modified Date";"Last Modified Date")
                {
                    Caption = 'Last modified Date';
                }
            }
            group("Invoicing")
            {
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field("Vat. Prod. Posting Group";"Vat. Prod. Posting Group")
                {
                    Caption = 'Vat. Prod. Posting Group';
                }
                field(Price;Price)
                {
                    Caption = 'Price';
                }
            }
        }
        area(FactBoxes)
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
            group("Seminar")
            {
                action("Comments")
                {
                    //RunObject=page "Seminar Comment Sheet";
                    //RunPageLink = "Table Name" = const(Seminar),"No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                }
            }
        }
    }
    
    var
        myInt : Integer;
}