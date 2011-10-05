/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * The RetentionManager object is accessed via Session.get_retention_manager().
	 */
	public interface RetentionManager : Object {

		/**
		 * Returns all hold objects that have been added through this API to the
		 * existing node at absPath.
		 *
		 * If no hold has been set before, this method returns an empty array.
		 *
		 * @param absPath The absolute path to a node.
		 * @return array of all {@link Hold} objects that have been added to the existing node at absPath through this API or an
		 *               empty array if no hold has been set.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficient access to retrieve the node.
		 * @throws AccessDeniedException if the current session does not have sufficient access to
		 *                                      retrieve the holds.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Hold[] get_holds (string absPath);

		/**
		 * Places a hold on the existing node at absPath.
		 *
		 * If isDeep is true the hold applies to this node and its subgraph.
		 * The hold does not take effect until a save is performed. A node may have
		 * more than one hold. The format and interpretation of the name are not
		 * specified. They are application-dependent.
		 *
		 * @param absPath The absolute path to a node.
		 * @param name An application-dependent string.
		 * @param isDeep A boolean indicating if the hold applies to the subgraph.
		 * @return The {@link Hold} applied.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficient access to retrieve the node.
		 * @throws AccessDeniedException if the current session does not have sufficient access to
		 *                                      perform the operation.
		 * @throws LockException if a lock applies at the node at absPath and this implementation
		 *                                   performs this validation immediately.
		 * @throws VersionException if the node at absPath is read-only due to a checked-in node
		 *                                         and this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Hold add_hold (string absPath, string name, bool isDeep);

		/**
		 * Removes the specified hold from the node at absPath.
		 *
		 * The removal does not take effect until a save is performed.
		 *
		 * @param absPath an absolute path.
		 * @param hold the {@link Hold} to be removed.
		 * @return void
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficient access to retrieve the node.
		 * @throws AccessDeniedException if the current session does not have sufficient access to
		 *                                      perform the operation.
		 * @throws LockException if a lock applies at the node at absPath and this implementation
		 *                                   performs this validation immediately.
		 * @throws VersionException if the node at absPath is read-only due to a checked-in
		 *                                         node and this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void remove_hold (string absPath, Hold hold);

		/**
		 * Gets the retention poilcy of a node identified by its path.
		 *
		 * Returns the retention policy that has been set using set_retention_policy()
		 * on the node at absPath or null if no policy has been set.
		 *
		 * @param absPath an absolute path to an existing node.
		 * @return RetentionPolicy The retention policy that applies to the existing
		 *                                                   node at absPath or null if no policy applies.
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficient access to retrieve the node.
		 * @throws AccessDeniedException if the current session does not have sufficient access to
		 *                                      retrieve the policy.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract RetentionPolicy get_retention_policy (string absPath);

		/**
		 * Sets a retention policy of a node idetified by the given path.
		 *
		 * Sets the retention policy of the node at absPath to that defined in the
		 * specified policy node. Interpretation and enforcement of this policy is an
		 * implementation issue. In any case the policy does does not take effect
		 * until a save is performed.
		 *
		 * @param absPath an absolute path to an existing node.
		 * @param retention {@link RetentionPolicy} policy.
		 * @return void
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficient access to retrieve the node.
		 * @throws AccessDeniedException if the current session does not have sufficient access to
		 *                                      perform the operation.
		 * @throws LockException if a lock applies at the node at absPath and this implementation
		 *                                   performs this validation immediately.
		 * @throws VersionException if the node at absPath is read-only due to a checked-in node
		 *                                         and this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void set_retention_policy (string absPath, RetentionPolicy retention);

		/**
		 * Removes a previous set retention policy.
		 *
		 * Causes the current retention policy on the node at absPath to no longer
		 * apply. The removal does not take effect until a save is performed.
		 *
		 * @param absPath an absolute path to an existing node.
		 * @return void
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficient access to retrieve the node.
		 * @throws AccessDeniedException if the current session does not have sufficient access to
		 *                                      perform the operation.
		 * @throws LockException if a lock applies at the node at absPath and this implementation
		 *                                   performs this validation immediately.
		 * @throws VersionException if the node at absPath is read-only due to a checked-in node
		 *                                         and this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void remove_retention_policy (string absPath);
	}
}
