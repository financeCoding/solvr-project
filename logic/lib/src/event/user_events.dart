// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This is commercial software. Use or redistribution of this code in full 
// or in part without the express written consent of Solvr is prohibited.

part of solvr_logic;

class UserCreated extends DomainEvent {
  UserCreated(this.userId, this.name, this.email);
  
  // TODO add time
  final Guid userId;
  final String name, email;
}
