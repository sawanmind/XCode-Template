//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//
//  Template generated by Sawan Kumar
//

import UIKit

class ___VARIABLE_productName:identifier___ViewController: UIViewController, ___VARIABLE_productName:identifier___ViewProtocol {

	var viewModel: ___VARIABLE_productName:identifier___ViewModelProtocol?
    var viewState: ___VARIABLE_productName:identifier___ViewState = .initial {didSet {self.updateViewState()}}
    
    static func createModule() -> UIViewController {
        let view = ___VARIABLE_productName:identifier___ViewController()
        let viewModel = ___VARIABLE_productName:identifier___ViewModel(view: view)
        view.viewModel = viewModel
        return view
    }
    
    override func loadView() {
        super.loadView()
        self.viewState = .initial
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.inputState = .fetch
    }
    
    private func setupUI() {
        self.view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    private lazy var containerView:___VARIABLE_productName:identifier___View = {
       let instance = ___VARIABLE_productName:identifier___View()
        instance.translatesAutoresizingMaskIntoConstraints = false
        instance.backgroundColor = .white
        instance.viewModel = self.viewModel
        return instance
    }()

    private func updateViewState() {
        switch viewState {
            
        case .initial:
            setupUI()
        case .startLoader:
             fatalError("TO DO: Start your loader")
        case .stopLoader:
            fatalError("TO DO: Stop your loader")
        case .empty:
            fatalError("TO DO: Handle empty state")
        case .error(_):
            fatalError("TO DO: Handle error state")
        case .populate(let model):
            self.containerView.updateUI(with: model)
        }
    }
}
