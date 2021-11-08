//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//
//  Template generated by Sawan Kumar
//

import UIKit

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresenterProtocol, ___VARIABLE_productName:identifier___InteractorOutputProtocol {

    weak private var view: ___VARIABLE_productName:identifier___ViewProtocol?
    private var interactor: ___VARIABLE_productName:identifier___InteractorInputProtocol?
    private let router: ___VARIABLE_productName:identifier___WireframeProtocol

    init(interface: ___VARIABLE_productName:identifier___ViewProtocol, interactor: ___VARIABLE_productName:identifier___InteractorInputProtocol?, router: ___VARIABLE_productName:identifier___WireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    var inputState: ___VARIABLE_productName:identifier___PresenterState? {
        didSet {
            guard let inputState = self.inputState else {return}
            switch inputState {
            case .fetch:
                self.view?.viewState = .startLoader
                self.interactor?.fetch()
            }
        }
    }
    
    var outputState: ___VARIABLE_productName:identifier___InteractorOutputState? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else {return}
                guard let outputState = self.outputState else {return}
                switch outputState {
                case .empty:
                    self.view?.viewState = .stopLoader
                    self.view?.viewState = .empty
                case .error(let error):
                    self.view?.viewState = .stopLoader
                    self.view?.viewState = .error(error)
                case .populate(let model):
                    self.view?.viewState = .stopLoader
                    self.view?.viewState = .populate(model)
                }
            }
        }
    }
    
    func route(_ to: String) {
        self.router.route(to)
    }
}