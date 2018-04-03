package br.com.tokenlab.presentation.presenter

import br.com.tokenlab.domain.usecase.SumUseCase
import br.com.tokenlab.domain.usecase.SumUseCaseRequest
import br.com.tokenlab.domain.usecase.common.UseCaseHandler
import br.com.tokenlab.presentation.contract.CalculatorPresenterProtocol
import br.com.tokenlab.presentation.contract.CalculatorViewProtocol

class CalculatorPresenter(

        private val useCaseHandler: UseCaseHandler,
        private val sumUseCase: SumUseCase

) : CalculatorPresenterProtocol {

    private var view: CalculatorViewProtocol? = null

    override fun takeView(view: CalculatorViewProtocol) {
        this.view = view
    }

    override fun dropView() {
        this.view = null
    }

    override fun sum(request: SumUseCaseRequest) {
        useCaseHandler.executeUseCase(sumUseCase, request, {
            view?.showResult(it.result)
        }, {
            // never fails
        })
    }
}
