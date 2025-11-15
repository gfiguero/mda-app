class EmployeesController < ApplicationController
  load_and_authorize_resource
  include Pagy::Method

  before_action :set_employee, only: %i[show edit update destroy]
  before_action :set_employees, only: :index
  before_action :disabled_pagination
  after_action { response.headers.merge!(@pagy.headers_hash) if @pagy }

  # GET /employees
  def index
    @pagy, @employees = pagy(@employees)

    respond_to do |format|
      format.html
      format.json
      format.turbo_stream
    end
  end

  # GET /employees/search.json
  def search
    @employees = params[:items].present? ? Employee.new.filter_by_id(params[:items]) : Employee.accessible_by(current_ability)

    respond_to do |format|
      format.json
      format.turbo_stream
    end
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, created: I18n.t("employee.message.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to @employee, updated: I18n.t("employee.message.updated"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy!
    redirect_to employees_path, deleted: I18n.t("employee.message.destroyed"), status: :see_other, format: :html
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.expect(employee: [:first_name, :last_name, :identification_number, :identification_code, :identification_type, :email_address])
  end

  def set_employees
    @employees = Employee.accessible_by(current_ability) || Employee.none
    @employees = @employees.send(sort_scope(sort_params[:sort_column].to_s), sort_params[:sort_direction]) if sort_params.present?
    filter_params.each { |attribute, value| @employees = @employees.send(filter_scope(attribute), value) } if filter_params.present?
  end

  def sort_params
    params.permit(:sort_column, :sort_direction)
  end

  def filter_params
    params.permit(:id, :first_name, :last_name, :identification_number, :identification_code, :identification_type, :email_address).reject { |key, value| value.blank? }
  end

  def disabled_pagination
    render json: Employee.all if params[:items] == "all"
  end
end
