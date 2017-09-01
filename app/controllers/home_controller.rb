class HomeController < ApplicationController

  def index
    @employees = Employee.all()
    availableEmps = Employee.where(previousWinner: false)

    if availableEmps.length === 0
      Employee.update_all(previousWinner: false)
      @availableEmps = @employees
    else
      @availableEmps = availableEmps
    end

    @unavailableEmps = Employee.where(previousWinner: true)
  end

  def select_winner
    availableEmps = Employee.where(previousWinner: false)
    employees = availableEmps.order("RANDOM()")
    selectedEmp = employees.first()
    @winner = selectedEmp;
    selectedEmp.update(previousWinner: true)
  end
end
