An attempt and using the very nice but also slightly confusing NSRuleEditor.
----------------------------------------------------------------------------

This code borrows heavily from [kainjow's example code](http://forums.macrumors.com/showthread.php?t=948727) from the MacRumors Forum.

Oddities and things I don't understand:

**1)	How do we communicate changes between the model and the view?**

NSRuleEditor has a -selectedRowIndexes, -displayValuesForRow and -criteriaForRow methods. However, the selectedRowIndexes does not correspond to the row that the user is editing (at least not in the code here). -selectedRowIndexes is often empty and when, it does (seemingly randomly) contain values, the index does not correspond to the row the user edited. Either I am expecting something different from this method or something is incorrect with the code, or both. 

If we can reliably get the row index, the I anticipate synchronising model and view will not be too difficult.

**2) The target/action method of NSRuleEditor sets the target and the action to NULL**

I am not joking. If you hook up the target/action of NSRuleEditor in interface builder then it will not fire. After hours of messing around, I finally subclassed NSRuleEditor and intercept the target/action manually. They are stored as instance variables in the subclass and target/action seems to work.

The target/action is used as a way to collect changes to NSTextField (custom views) rows. I connect (in IB) an NSTextField to this method (via the First Responder), it fires when editing is complete. This way I can extract values from text fields.

I anticipate there is a better way of doing this.

