codeunit 123456739 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
  [EventSubscriber(ObjectType::Codeunit, 212,'OnBeforeResLedgEntryInsert', '', true, true)]
  local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry : Record "Res. Ledger Entry";ResJournalLine : Record "Res. Journal Line");
  var
    c : Codeunit "Res. Jnl.-Post Line";
  begin   
      ResLedgerEntry."CSD Seminar No.":=ResJournalLine."CSD Seminar No.";
      ResLedgerEntry."CSD Seminar Registration No.":=ResJournalLine."CSD Seminar Registration No."; 
  end;

  [EventSubscriber(ObjectType::page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
  local procedure ExtendNavigateOnAfterNavigateFindRecords(var DocumentEntry:Record "Document Entry";DocNoFilter:text;PostingDatefilter:text);
  var
    SeminarLedgerEntry : record "CSD Seminar Ledger Entry";
    PostedSeminarRegHeader : Record "CSD Posted Seminar Reg. Header";
    DocNoOfRecords : Integer;
    NextEntryNo : Integer;
  begin
    if PostedSeminarRegHeader.readpermission THEN begin
      PostedSeminarRegHeader.reset;
      PostedSeminarRegHeader.setfilter("No.",DocNoFilter);
      PostedSeminarRegHeader.setfilter("Posting Date",PostingDatefilter);
      DocNoOfRecords := PostedSeminarRegHeader.count;
    END;
    if DocNoOfRecords = 0 then
      exit;
    With DocumentEntry do begin
      if findlast then
        NextEntryNo := SeminarLedgerEntry."Entry No." + 1
      else
        NextEntryNo := 1;
      Clear(DocumentEntry);
      "Entry No." := NextEntryNo;
      "Document Type" := 0;
      "Table ID" := Database::"CSD Posted Seminar Reg. Header";
      "Table Name" := Copystr(PostedSeminarRegHeader.TableCaption,1,MaxStrLen("Table Name"));
      "No. of Records" := DocNoOfRecords;
      Insert;
    end;
  end;

 [EventSubscriber(ObjectType::page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
  local procedure ExtendNavigateOnAfterNavigateFindRecordsLE(var DocumentEntry:Record "Document Entry";DocNoFilter:text;PostingDatefilter:text);
  var
    SeminarLedgerEntry : record "CSD Seminar Ledger Entry";
    PostedSeminarRegHeader : Record "CSD Posted Seminar Reg. Header";
    DocNoOfRecords : Integer;
    NextEntryNo : Integer;
  begin
    if SeminarLedgerEntry.readpermission THEN begin
      SeminarLedgerEntry.reset;
      SeminarLedgerEntry.setfilter("Document No.",DocNoFilter);
      SeminarLedgerEntry.setfilter("Posting Date",PostingDatefilter);
      DocNoOfRecords := SeminarLedgerEntry.count;
    END;
    if DocNoOfRecords = 0 then
      exit;
    With DocumentEntry do begin
      if findlast then
        NextEntryNo := SeminarLedgerEntry."Entry No." + 1
      else
        NextEntryNo := 1;
      Clear(DocumentEntry);
      "Entry No." := NextEntryNo;
      "Document Type" := 0;
      "Table ID" := Database::"CSD Seminar Ledger Entry";
      "Table Name" := Copystr(SeminarLedgerEntry.TableCaption,1,MaxStrLen("Table Name"));
      "No. of Records" := DocNoOfRecords;
      Insert;
    end;
  end;

  [EventSubscriber(ObjectType::page, 344, 'OnAfterNavigateShowRecords', '', true, true)]
  local procedure ShowRecords(TableId:Integer;DocNoFilter : text;PostingDateFilter:text;ItemTrackingSearch:Boolean);
  var
    SeminarLedgerEntry : record "CSD Seminar Ledger Entry";
    PostedSeminarRegHeader : Record "CSD Posted Seminar Reg. Header";
  begin
    Case TableId of
      Database::"CSD Posted Seminar Reg. Header": begin
        PostedSeminarRegHeader.setfilter("No.",DocNoFilter);
        PostedSeminarRegHeader.setfilter("Posting Date",PostingDateFilter);
        page.run(0,PostedSeminarRegHeader);
      end;
      Database::"CSD Seminar Ledger Entry":begin
        SeminarLedgerEntry.setfilter("Document No.",DocNoFilter);
        SeminarLedgerEntry.setfilter("Posting Date",PostingDateFilter);
        page.run(0,SeminarLedgerEntry);
      end;
    END;    
  end;
}
