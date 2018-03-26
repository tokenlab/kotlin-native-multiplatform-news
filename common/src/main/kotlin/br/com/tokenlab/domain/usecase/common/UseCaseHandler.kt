package br.com.tokenlab.domain.usecase.common

class UseCaseHandler() {

    fun <Rq : UseCaseRequest, Rs : UseCaseResponse> executeUseCase(useCase: UseCase<Rq, Rs>, request: Rq, success: (Rs) -> Unit, error: () -> Unit) {
        useCase.request = request
        useCase.success = success
        useCase.error = error

        useCase.run()
    }
}