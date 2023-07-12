class Expense {
  public var name: String;
  public var amount: Float;
  public var date: String;
  
  public function new(name: String, amount: Float, date: String) {
    this.name = name;
    this.amount = amount;
    this.date = date;
  }
}

class ExpenseTracker {
  public var expenses: Array<Expense>;
  
  public function new() {
    expenses = [];
  }
  
  public function addExpense(name: String, amount: Float, date: String): Void {
    var expense = new Expense(name, amount, date);
    expenses.push(expense);
  }
  
  public function getTotalExpense(): Float {
    var total: Float = 0;
    for (expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
  
  public function getExpensesByDate(date: String): Array<Expense> {
    var filteredExpenses: Array<Expense> = [];
    for (expense in expenses) {
      if (expense.date == date) {
        filteredExpenses.push(expense);
      }
    }
    return filteredExpenses;
  }
}

class Main {
  static function main(): Void {
    var tracker = new ExpenseTracker();
    
    tracker.addExpense("Groceries", 50.0, "2023-05-01");
    tracker.addExpense("Utilities", 100.0, "2023-05-01");
    tracker.addExpense("Dinner", 30.0, "2023-05-02");
    tracker.addExpense("Transportation", 20.0, "2023-05-03");
    
    var total = tracker.getTotalExpense();
    trace("Total Expense: $" + total);
    
    var expensesOnDate = tracker.getExpensesByDate("2023-05-01");
    trace("Expenses on 2023-05-01:");
    for (expense in expensesOnDate) {
      trace(expense.name + ": $" + expense.amount);
    }
  }
}
