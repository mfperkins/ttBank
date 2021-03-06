# TechTest 2 - Bank Accounts

User Specification
---

* You should be able to interact with the your code via IRB.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

User Acceptance Criteria
---

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

How to run this application
---
1. Clone this repo --> `$ git clone https://github.com/mfperkins/ttBank`
2. Change into this new directory --> `$ cd ttBank`
3. Start up irb --> `$ irb`
4. Load the files `$ require './lib/account.rb'` and `require './lib/transaction.rb'`
5. Create a new bank `$ myAccount = Account.new`
6. Make a few deposits and withdrawals
   * `$ myAccount.deposit(1000)`
   * `$ myAccount.deposit(2000)`
   * `$ myAccount.withdrawal(500)`
7. Print your statement to see your transactions `$ myAccount.statement`

Sample IRB output
---
```sh
2.3.0 :001 > require './lib/account.rb'
 => true
2.3.0 :002 > myAccount = Account.new
 => #<Account:0x007fc99f050300 @balance=0, @transaction_history=#<TransactionHistory:0x007fc99f0502d8 @log=[]>>
2.3.0 :003 > myAccount.deposit(1000)
 => 1000
2.3.0 :004 > myAccount.deposit(2000)
 => 3000
2.3.0 :005 > myAccount.withdrawal(500)
 => 2500
2.3.0 :006 > myAccount.statement
   date    || credit || debit || balance
2016/10/18 ||        ||  500  ||  2500
2016/10/18 ||  2000  ||       ||  3000
2016/10/18 ||  1000  ||       ||  1000
 => #[#<Transaction:0x007fc99e071218 @time=2016-10-18 14:13:12 +0100, @amount=500, @type="debit", @current_balance=2500>, #<Transaction:0x007fc99e9445e8 @time=2016-10-18 14:13:01 +0100, @amount=2000, @type="credit", @current_balance=3000>, #<Transaction:0x007fc99f80af78 @time=2016-10-18 14:12:55 +0100, @amount=1000, @type="credit", @current_balance=1000>]
```
