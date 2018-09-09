// Auto-generated. Do not edit!

// (in-package rll_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JobStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
      this.status_detail = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('status_detail')) {
        this.status_detail = initObj.status_detail
      }
      else {
        this.status_detail = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JobStatus
    // Serialize message field [status]
    bufferOffset = _serializer.uint8(obj.status, buffer, bufferOffset);
    // Serialize message field [status_detail]
    bufferOffset = _serializer.string(obj.status_detail, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JobStatus
    let len;
    let data = new JobStatus(null);
    // Deserialize message field [status]
    data.status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_detail]
    data.status_detail = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.status_detail.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rll_msgs/JobStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ded0e6920d3687094231ffc64e57394c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 status
    uint8 SUCCESS = 0
    uint8 FAILURE = 1
    uint8 INTERNAL_ERROR = 2
    string status_detail
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JobStatus(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.status_detail !== undefined) {
      resolved.status_detail = msg.status_detail;
    }
    else {
      resolved.status_detail = ''
    }

    return resolved;
    }
};

// Constants for message
JobStatus.Constants = {
  SUCCESS: 0,
  FAILURE: 1,
  INTERNAL_ERROR: 2,
}

module.exports = JobStatus;
