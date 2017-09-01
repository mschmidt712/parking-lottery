class EmployeesController < ApplicationController
  def create
    Employee.create(employee_params)
    redirect_to root_path
  end

  def update
    employee = Employee.find(params[:id])
    availabilityBool = employee.previousWinner;

    employee.update(previousWinner: !availabilityBool)
    redirect_to root_path
  end

  def destroy
    Employee.destroy(params[:id])
    redirect_to root_path
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :previousWinner)
  end
end
