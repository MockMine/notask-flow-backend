CREATE TABLE IF NOT EXISTS `nt_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '登录日志标识',
  `user_id` bigint DEFAULT NULL COMMENT '用户标识',
  `account` varchar(100) NOT NULL COMMENT '登录账号',
  `client_type` varchar(30) DEFAULT NULL COMMENT '客户端类型',
  `device_id` varchar(100) DEFAULT NULL COMMENT '设备标识',
  `ip_address` varchar(80) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) DEFAULT NULL COMMENT 'User-Agent',
  `success` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否成功',
  `fail_reason` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_login_log_user_create` (`user_id`, `gmt_create`),
  KEY `idx_login_log_account_create` (`account`, `gmt_create`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志表';

CREATE TABLE IF NOT EXISTS `nt_admin_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '管理操作日志标识',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `method` varchar(10) NOT NULL COMMENT '请求方法',
  `path` varchar(255) NOT NULL COMMENT '请求路径',
  `operation_name` varchar(255) DEFAULT NULL COMMENT '操作名称',
  `ip_address` varchar(80) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) DEFAULT NULL COMMENT 'User-Agent',
  `success` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否成功',
  `error_message` varchar(500) DEFAULT NULL COMMENT '错误信息',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_admin_operation_operator_create` (`operator`, `gmt_create`),
  KEY `idx_admin_operation_path_create` (`path`, `gmt_create`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理操作日志表';
