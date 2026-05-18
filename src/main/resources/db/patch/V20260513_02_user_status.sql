ALTER TABLE `nt_user`
  ADD COLUMN `status` varchar(20) NOT NULL DEFAULT 'NORMAL' COMMENT '账号状态' AFTER `avatar_url`;
