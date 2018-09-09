// Auto-generated. Do not edit!

// (in-package rll_msgs.srv)


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

class PickPlaceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose_above = null;
      this.pose_grip = null;
      this.gripper_close = null;
      this.grasp_object = null;
    }
    else {
      if (initObj.hasOwnProperty('pose_above')) {
        this.pose_above = initObj.pose_above
      }
      else {
        this.pose_above = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('pose_grip')) {
        this.pose_grip = initObj.pose_grip
      }
      else {
        this.pose_grip = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('gripper_close')) {
        this.gripper_close = initObj.gripper_close
      }
      else {
        this.gripper_close = false;
      }
      if (initObj.hasOwnProperty('grasp_object')) {
        this.grasp_object = initObj.grasp_object
      }
      else {
        this.grasp_object = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PickPlaceRequest
    // Serialize message field [pose_above]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose_above, buffer, bufferOffset);
    // Serialize message field [pose_grip]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose_grip, buffer, bufferOffset);
    // Serialize message field [gripper_close]
    bufferOffset = _serializer.bool(obj.gripper_close, buffer, bufferOffset);
    // Serialize message field [grasp_object]
    bufferOffset = _serializer.string(obj.grasp_object, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PickPlaceRequest
    let len;
    let data = new PickPlaceRequest(null);
    // Deserialize message field [pose_above]
    data.pose_above = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose_grip]
    data.pose_grip = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [gripper_close]
    data.gripper_close = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [grasp_object]
    data.grasp_object = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.grasp_object.length;
    return length + 117;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rll_msgs/PickPlaceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3060b6166dbcc78c572755b07312c70f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose pose_above
    geometry_msgs/Pose pose_grip
    bool gripper_close
    string grasp_object
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PickPlaceRequest(null);
    if (msg.pose_above !== undefined) {
      resolved.pose_above = geometry_msgs.msg.Pose.Resolve(msg.pose_above)
    }
    else {
      resolved.pose_above = new geometry_msgs.msg.Pose()
    }

    if (msg.pose_grip !== undefined) {
      resolved.pose_grip = geometry_msgs.msg.Pose.Resolve(msg.pose_grip)
    }
    else {
      resolved.pose_grip = new geometry_msgs.msg.Pose()
    }

    if (msg.gripper_close !== undefined) {
      resolved.gripper_close = msg.gripper_close;
    }
    else {
      resolved.gripper_close = false
    }

    if (msg.grasp_object !== undefined) {
      resolved.grasp_object = msg.grasp_object;
    }
    else {
      resolved.grasp_object = ''
    }

    return resolved;
    }
};

class PickPlaceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PickPlaceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PickPlaceResponse
    let len;
    let data = new PickPlaceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rll_msgs/PickPlaceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PickPlaceResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PickPlaceRequest,
  Response: PickPlaceResponse,
  md5sum() { return 'f9e1ce2e36454c554259d3461e945fff'; },
  datatype() { return 'rll_msgs/PickPlace'; }
};
