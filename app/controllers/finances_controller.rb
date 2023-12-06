# frozen_string_literal: true

class FinancesController < ApplicationController
  CATEGORIES = { 'Candidate Loan' => 'candidate-loan', 'Contribution Total' => 'contribution-total',
    'Debts Owed' => 'debts-owed', 'Disbursements Total' => 'disbursements-total',
    'End Cash' => 'end-cash', 'Individual Total' => 'individual-total', 'PAC Total' => 'pac-total',
    'Receipts Total' => 'receipts-total', 'Refund Total' => 'refund-total' }.freeze

  def index
    @categories = CATEGORIES
  end

  def search
    response = JSON.parse(Finance.campaign_finances_to_representative_params(params))
    @cycle = params[:cycle]
    @category = get_category_key(params[:category], 1)
    # puts "search category"
    # puts @category
    @results = get_canidate_category(response['results'], CATEGORIES[@category.to_s]).take(20)
  end

  private

  def get_category_key(category, type)
    data_keys = { 'disbursements-total' => ['total_disbursements', 'Disbursements Total'],
      'candidate-loan' => ['candidate_loans', 'Candidate Loan'], 'debts-owed' => ['debts_owed', 'Debts Owed'],
      'end-cash' => ['end_cash', 'End Cash'], 'individual-total' => ['total_from_individuals', 'Individual Total'],
      'pac-total' => ['total_from_pacs', 'PAC Total'], 'receipts-total' => ['total_receipts', 'Receipts Total'],
      'contribution-total' => ['total_contributions', 'Contribution Total'],
      'refund-total' => ['total_refunds', 'Refund Total'] }
    type.zero? ? data_keys[category.to_s][0] : data_keys[category.to_s][1]
  end

  def get_canidate_category(result, category)
    actual_category = get_category_key(category, 0)
    # puts "actual category"
    # puts actual_category

    candidates = result.map do |candidate|
      { name: candidate['name'], amount: candidate[actual_category.to_s] || 0 }
    end

    candidates.sort_by { |candidate| -candidate[:amount] }
  end
end
