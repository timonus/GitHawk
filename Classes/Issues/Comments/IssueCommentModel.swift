//
//  IssueCommentModel.swift
//  Freetime
//
//  Created by Ryan Nystrom on 5/19/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import Foundation
import IGListKit

final class IssueCommentModel: ListDiffable {

    let id: String
    let details: IssueCommentDetailsViewModel
    let bodyModels: [ListDiffable]
    let reactions: IssueCommentReactionViewModel
    let collapse: (model: AnyObject, height: CGFloat)?
    let number: Int?
    let rawMarkdown: String

    enum ThreadState {
        case single
        case neck
        case tail
    }
    let threadState: ThreadState

    init(
        id: String,
        details: IssueCommentDetailsViewModel,
        bodyModels: [ListDiffable],
        reactions: IssueCommentReactionViewModel,
        collapse: (AnyObject, CGFloat)?,
        threadState: ThreadState,
        rawMarkdown: String
        ) {
        self.id = id
        self.details = details
        self.bodyModels = bodyModels
        self.reactions = reactions
        self.collapse = collapse
        self.threadState = threadState
        self.number = GraphQLIDDecode(id: id, separator: "IssueComment")
        self.rawMarkdown = rawMarkdown
    }

    // MARK: ListDiffable

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }


}
