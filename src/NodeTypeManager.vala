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
	 * Allows for the retrieval and (in implementations that support it) the
	 * registration of node types. Accessed via Workspace.get_node_type_manager().
	 */
	public interface NodeTypeManager : Object {

		/**
		 * Returns the named node type.
		 *
		 * @param nodeTypeName the name of an existing node type.
		 * @return A {@link NodeType} instance.
		 *
		 * @throws NoSuchNodeTypeException if no node type by the given name exists.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract NodeType get_node_type(string nodeTypeName);

		/**
		 * Determines if the given node type is registered.
		 *
		 * Returns true if a node type with the specified name is registered. Returns
		 * false otherwise.
		 *
		 * @param name The name of node type.
		 * @return True, if the node type identified by its name is registered, else false.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract bool has_node_type(string name);

		/**
		 * FIXME, original API returns Iterator
		 */
		public abstract NodeType[] getAllNodeTypes();

		/**
		 * FIXME, original API returns Iterator
		 */
		public abstract NodeType[] get_primary_node_types();

		/**
		 * FIXME, original API returns Iterator
		 */
		public abstract NodeType[] get_mixin_node_types();

		/**
		 * Returns an empty NodeTypeTemplate which can then be used to define a node type
		 * and passed to NodeTypeManager.register_node_type().
		 *
		 * If definition is given:
		 * Returns a NodeTypeTemplate holding the specified node type definition. This
		 * template can then be altered and passed to NodeTypeManager.register_node_type().
		 *
		 * @param ntd a {@link NodeTypeDefinition}
		 * @return a {@link NodeTypeTemplate}.
		 *
		 * @throws UnsupportedRepositoryOperationException if this implementation does not supporteplate
		 *                                                        node type registration.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract NodeTypeTemplate create_node_type_template (NodeTypeDefinition? ntd);

		/**
		 * Returns an empty NodeDefinitionTemplate which can then be used to create a
		 * child node definition and attached to a NodeTypeTemplate.
		 *
		 * @return a {@link NodeDefinitionTemplate}.
		 *
		 * @throws UnsupportedRepositoryOperationException if this implementation does not support
		 *                                                        node type registration.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract NodeDefinitionTemplate create_node_definition_template();

		/**
		 * Returns an empty PropertyDefinitionTemplate which can then be used to create
		 * a property definition and attached to a NodeTypeTemplate.
		 *
		 * @return a {@link PropertyDefinitionTemplate}.
		 *
		 * @throws UnsupportedRepositoryOperationException if this implementation does not support
		 *                                                        node type registration.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract PropertyDefinitionTemplate create_property_definition_template();

		/**
		 * Registers a new node type or updates an existing node type using the specified
		 * definition and returns the resulting NodeType object.
		 *
		 * Typically, the object passed to this method will be a 
		 * NodeTypeTemplate (a subclass of NodeTypeDefinition)
		 * acquired from NodeTypeManager.create_node_type_template()
		 * and then filled-in with definition information.
		 *
		 * @param ntd a {@link NodeTypeDefinition}
		 * @param allowUpdate whether to fail if node already exists or to update it
		 * @return NodeType the registered node type
		 *
		 * @throws InvalidNodeTypeDefinitionException if the NodeTypeDefinition is invalid.
		 * @throws NodeTypeExistsException if allowUpdate is false and the NodeTypeDefinition
		 *                                                 specifies a node type name that is already registered.
		 * @throws UnsupportedRepositoryOperationException if this implementation does not support
		 *                                                        node type registration.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract NodeType register_node_type(NodeTypeDefinition ntd, bool allowUpdate);

		/**
		 * Registers or updates the specified array of NodeTypeDefinition objects.
		 *
		 * This method is used to register or update a set of node types with mutual
		 * dependencies. Returns an iterator over the resulting NodeType objects.
		 * The effect of the method is "all or nothing"; if an error occurs, no node
		 * types are registered or updated.
		 *
		 * @param definitions an array of NodeTypeDefinition
		 * @param allowUpdate whether to fail if node already exists or to update it
		 * @return array of newly registered {@link NodeType} instances
		 *
		 * @throws InvalidNodeTypeDefinitionException if a NodeTypeDefinition within the Collection is
		 *                                                   invalid or if the Collection contains an object of a
		 *                                                   type other than NodeTypeDefinition.
		 * @throws NodeTypeExistsException if allowUpdate is false and a NodeTypeDefinition within
		 *                                                 the Collection specifies a node type name that is already
		 *                                                 registered.
		 * @throws UnsupportedRepositoryOperationException if this implementation does not support node type
		 *                                                        registration.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract NodeType[] register_node_types(NodeTypeDefinition[] definitions, bool allowUpdate);

		/**
		 * Unregisters the specified node type.
		 *
		 * @param name The name of the node type to be removed from the registry.
		 * @return void
		 *
		 * @throws UnsupportedRepositoryOperationException if this implementation does not
		 *                                                        support node type registration.
		 * @throws NoSuchNodeTypeException if no registered node type exists with the specified name.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void unregister_node_type(string name);

		/**
		 * Unregisters the specified set of node types. Used to unregister a set of node
		 * types with mutual dependencies.
		 *
		 * @param names List of node type names to be removed from the registry.
		 * @return void
		 *
		 * @throws UnsupportedRepositoryOperationException if this implementation does not support
		 *                                                        node type registration.
		 * @throws NoSuchNodeTypeException if one of the names listed is not a registered node type.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void unregister_node_types(string[] names);
	}
}
