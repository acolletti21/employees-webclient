class EmployeesController < ApplicationController

  def index
    @employees = Unirest.get("http://localhost:3000/api/v1/employees.json").body
  end

  def create
    @employee = Employee.create(
                                first_name: params[:first_name],
                                last_name: params[:last_name],
                                email: params[:email]
                                )
    @employee = Unirest.post(
                              "http://localhost:3000/api/v1/employees",
                              headers: {
                                        "Accept" => "application/json"
                                        },
                              paramaters: {
                                          first_name: params[:first_name],
                                          last_name: params[:last_name],
                                          email: params[:email]
                                        }

                              ).body
    
    redirect_to "/employees/#{@employee["id"]}"
  end

  def show
    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}.json").body
  end



end
