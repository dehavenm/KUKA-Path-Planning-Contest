// Auto-generated. Do not edit!

// (in-package rll_planning_project.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class CheckPathRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose_start = null;
      this.pose_goal = null;
    }
    else {
      if (initObj.hasOwnProperty('pose_start')) {
        this.pose_start = initObj.pose_start
      }
      else {
        this.pose_start = new geometry_msgs.msg.Pose2D();
      }
      if (initObj.hasOwnProperty('pose_goal')) {
        this.pose_goal = initObj.pose_goal
      }
      else {
        this.pose_goal = new geometry_msgs.msg.Pose2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckPathRequest
    // Serialize message field [pose_start]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.pose_start, buffer, bufferOffset);
    // Serialize message field [pose_goal]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.pose_goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckPathRequest
    let len;
    let data = new CheckPathRequest(null);
    // Deserialize message field [pose_start]
    data.pose_start = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose_goal]
    data.pose_goal = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rll_planning_project/CheckPathRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a64bb936c67a976431689a78c534f6f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose2D pose_start
    geometry_msgs/Pose2D pose_goal
    
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckPathRequest(null);
    if (msg.pose_start !== undefined) {
      resolved.pose_start = geometry_msgs.msg.Pose2D.Resolve(msg.pose_start)
    }
    else {
      resolved.pose_start = new geometry_msgs.msg.Pose2D()
    }

    if (msg.pose_goal !== undefined) {
      resolved.pose_goal = geometry_msgs.msg.Pose2D.Resolve(msg.pose_goal)
    }
    else {
      resolved.pose_goal = new geometry_msgs.msg.Pose2D()
    }

    return resolved;
    }
};

class CheckPathResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.valid = null;
    }
    else {
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckPathResponse
    // Serialize message field [valid]
    bufferOffset = _serializer.bool(obj.valid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckPathResponse
    let len;
    let data = new CheckPathResponse(null);
    // Deserialize message field [valid]
    data.valid = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rll_planning_project/CheckPathResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a04c5033e7efda95fc3786e8d449c6e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool valid
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckPathResponse(null);
    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = false
    }

    return resolved;
    }
};

module.exports = {
  Request: CheckPathRequest,
  Response: CheckPathResponse,
  md5sum() { return '9853809de3dea14e77435e7b0de1d74a'; },
  datatype() { return 'rll_planning_project/CheckPath'; }
};
